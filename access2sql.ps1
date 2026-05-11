param(
    [string]$Source
)

$ScriptDir = $PSScriptRoot

function Release-Com {
    param($obj)
    try { [System.Runtime.InteropServices.Marshal]::ReleaseComObject($obj) | Out-Null } catch {}
    [GC]::Collect()
    [GC]::WaitForPendingFinalizers()
}

# =========================
# Locate database
# =========================

if ($Source) {

    if (-not (Test-Path $Source)) {
        Write-Error "Specified source file not found: $Source"
        exit 1
    }

    $accessFile = (Resolve-Path $Source).Path
}
else {

    $accdbFiles = @(Get-ChildItem $ScriptDir -Filter "*.accdb" -ErrorAction SilentlyContinue | Sort-Object Name)
    $mdbFiles   = @(Get-ChildItem $ScriptDir -Filter "*.mdb"   -ErrorAction SilentlyContinue | Sort-Object Name)

    if ($accdbFiles.Count -gt 0) {

        $accessFile = $accdbFiles[0].FullName
        Write-Host "Found ACCDB: $accessFile"
    }
    elseif ($mdbFiles.Count -gt 0) {

        Write-Host "Converting MDB → ACCDB..."

        $sourceMdb  = $mdbFiles[0].FullName
        $baseName   = [System.IO.Path]::GetFileNameWithoutExtension($sourceMdb)
        $accessFile = Join-Path $ScriptDir ($baseName + ".accdb")

        $access = New-Object -ComObject Access.Application
        $access.Visible = $false

        try {
            $access.NewCurrentDatabase($accessFile)
            $access.DoCmd.TransferDatabase(0, "Microsoft Access", $sourceMdb, 0, "", "")
        }
        finally {
            try { $access.Quit() } catch {}
            Release-Com $access
        }
    }
    else {
        Write-Error "No .accdb or .mdb found in $ScriptDir"
        exit 1
    }
}

Write-Host "Using database: $accessFile"

# =========================
# Export schema
# =========================

function Export-Schema {

    param([string]$AccessFile)

    $outFile = Join-Path $ScriptDir "schema.sql"

    $dao = New-Object -ComObject DAO.DBEngine.120
    $db  = $dao.OpenDatabase($AccessFile)

    $text = ""

    foreach ($table in $db.TableDefs) {

        if ($table.Name -like "MSys*") { continue }

        $text += "TABLE: $($table.Name)`n"

        foreach ($field in $table.Fields) {
            $text += "  $($field.Name)`n"
        }

        $text += "`n"
    }

    [System.IO.File]::WriteAllText($outFile, $text)
    Write-Host "Schema exported"
}

# =========================
# Export forms
# =========================

function Export-Forms {

    param([string]$AccessFile)

    $access = New-Object -ComObject Access.Application
    $access.Visible = $false
    $access.OpenCurrentDatabase($AccessFile)
try {
    foreach ($f in $access.CurrentProject.AllForms) {
            $path = Join-Path $ScriptDir ("form_" + $f.Name + ".txt")
            $access.SaveAsText(2, $f.Name, $path)
    }
} catch {
    $ex = $_.Exception
    
    Write-Host "===== ERROR DETAILS Export-Forms=====" -ForegroundColor Red
    Write-Host "Message            : $($ex.Message)"
    Write-Host "Exception Type     : $($ex.GetType().FullName)"
    Write-Host "Source             : $($ex.Source)"
    Write-Host "Target Site        : $($ex.TargetSite)"
    Write-Host "Stack Trace        :"
    Write-Host $ex.StackTrace

} finally {
    $access.Quit()
    Release-Com $access
}
}

# =========================
# Export reports
# =========================

function Export-Reports {

    param([string]$AccessFile)

    $access = New-Object -ComObject Access.Application
    $access.Visible = $false
    $access.OpenCurrentDatabase($AccessFile)

try {
    foreach ($r in $access.CurrentProject.AllReports) {
            $path = Join-Path $ScriptDir ("report_" + $r.Name + ".txt")
            $access.SaveAsText(3, $r.Name, $path)
    }

} catch {
    $ex = $_.Exception
    
    Write-Host "===== ERROR DETAILS Export-Reports=====" -ForegroundColor Red
    Write-Host "Message            : $($ex.Message)"
    Write-Host "Exception Type     : $($ex.GetType().FullName)"
    Write-Host "Source             : $($ex.Source)"
    Write-Host "Target Site        : $($ex.TargetSite)"
    Write-Host "Stack Trace        :"
    Write-Host $ex.StackTrace

} finally {
    $access.Quit()
    Release-Com $access
}
}


# =========================
# Export VBA
# =========================

function Export-VBA {

    param([string]$AccessFile)

    $access = New-Object -ComObject Access.Application
    $access.OpenCurrentDatabase($AccessFile)

    $proj = $access.VBE.VBProjects.Item(1)
try {
    foreach ($c in $proj.VBComponents) {
        $file = Join-Path $ScriptDir ("vba_" + $c.Name + ".bas")
        $c.Export($file)
    }

} catch {
    $ex = $_.Exception
    
    Write-Host "===== ERROR DETAILS Export-VBA=====" -ForegroundColor Red
    Write-Host "Message            : $($ex.Message)"
    Write-Host "Exception Type     : $($ex.GetType().FullName)"
    Write-Host "Source             : $($ex.Source)"
    Write-Host "Target Site        : $($ex.TargetSite)"
    Write-Host "Stack Trace        :"
    Write-Host $ex.StackTrace

} finally {
    $access.Quit()
    Release-Com $access
}
}

# =========================
# Export queries
# =========================

function Export-Queries {

    param([string]$AccessFile)

    $access = New-Object -ComObject Access.Application
    $access.OpenCurrentDatabase($AccessFile)

    $db = $access.CurrentDb()
try {
    foreach ($q in $db.QueryDefs) {

        if ($q.Name -like "~*" -or $q.Name -like "MSys*") { continue }
        if ([string]::IsNullOrWhiteSpace($q.SQL)) { continue }

        Write-Host "Exporting query: $($q.Name)"

        $path = Join-Path $ScriptDir ("query_" + $q.Name.Replace("/", "_") + ".sql")
        $q.SQL | Out-File $path -Encoding utf8
    }
} catch {
    $ex = $_.Exception
    
    Write-Host "===== ERROR DETAILS Export-Queries=====" -ForegroundColor Red
    Write-Host "Message            : $($ex.Message)"
    Write-Host "Exception Type     : $($ex.GetType().FullName)"
    Write-Host "Source             : $($ex.Source)"
    Write-Host "Target Site        : $($ex.TargetSite)"
    Write-Host "Stack Trace        :"
    Write-Host $ex.StackTrace

} finally { 

    $access.Quit()
    Release-Com $access
}
}

# =========================
# Run all
# =========================

Export-Schema  $accessFile
Export-Forms   $accessFile
Export-Reports $accessFile
Export-VBA     $accessFile
Export-Queries $accessFile

Write-Host "Done. All files saved to root folder."
