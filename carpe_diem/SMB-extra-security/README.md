H1 Opciones para aumentar la seguridad de SMB en UnRAID:
Dirigirnos a Settings --> SMB

SMB settings:
Hide "dot" files: no
Enhanced macOS interoperability: no
Enable NetBIOS: no
Enable WSD: no

SMB Extras:
Añadir lo siguiente dentro de Samba extra configuration:

#Extra security
server min protocol = SMB3_11
client ipc min protocol = SMB3_11
client signing = mandatory
server signing = mandatory
client ipc signing = mandatory
client NTLMv2 auth = yes
smb encrypt = required
restrict anonymous = 2
null passwords = No
raw NTLMv2 auth = no
