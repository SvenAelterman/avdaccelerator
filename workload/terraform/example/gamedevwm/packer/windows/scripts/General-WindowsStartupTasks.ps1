﻿schtasks /run /tn '\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser'; Start-Sleep -Seconds 10; Wait-Process -Name 'CompatTelRunner' -ErrorAction Ignore
Write-Output 'TASK COMPLETED: Microsoft Compatibility check completed...'