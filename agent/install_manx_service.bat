C:\Tools\nssm.exe install ManxAgent C:\Users\Public\manx.exe -socket "172.18.25.10:7010" -http "http://172.18.25.10:8888" -contact "tcp"
sc config ManxAgent start= auto
sc description ManxAgent "Manx agent service for Caldera connection."
sc start ManxAgent
