# Opciones para aumentar la seguridad de SMB en UnRAID:
***

### Dirigirnos a Settings --> SMB y configurar las siguientes opciones:

**SMB settings:**

- Hide "dot" files: no
- Enhanced macOS interoperability: no
- Enable NetBIOS: no
- Enable WSD: no

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "SMB settings")


**SMB Extras:**
Añadir lo siguiente dentro de Samba extra configuration:

```bash
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
```

![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "SMB extras")
