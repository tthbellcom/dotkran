## Configuration bits for [kran](https://github.com/tthbellcom/kran)

```
cd ~
git clone https://github.com/tthbellcom/dotkran.git .kran
```

## for 2.0 branch of kran and krog_proxy
```
TLD=tth

PRE_UP[0]='mailcatcher --smtp-ip 172.17.42.1'
PRE_UP[1]='kran_proxy start'

CLEAN[0]='killall mailcatcher'
CLEAN[0]='kran_proxy stop'

STATUS_CMD='kran_proxy status'
```
