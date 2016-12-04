$computername = 'av3320'
$CIMInstances = Get-CimInstance Win32_PerfFormattedData_PerfProc_Process -ComputerName $computername -Filter "Name='taskmgr' or name like'Notepad#%'" 


Foreach($CIMInstance in $CIMInstances)
{
get-process -computername $CIMInstance.PSComputerName -Id $CIMInstance.idprocess|
select-object name,
@{Name="WorkingSet(MB)}"; e={$_.WorkingSet64 / 1MB}},
machinename,
@{Name="PercentProcessorTime"; e={$CIMInstance.PercentProcessorTime}},
@{Name="threadcount"; e={$CIMInstance.threadcount}},
@{Name="Handlecount"; e={$CIMInstance.Handlecount}},id|ft -AutoSize

}










