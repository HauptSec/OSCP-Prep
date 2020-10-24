# Exploit Code

If you have not made any modifications to an exploit, you should only provide the URL where the exploit can be found. Do not include the full unmodified code, especially if it is several pages long.

If you have modified an exploit, you should include:

- The modified exploit code
- The URL to the original exploit code
- The command used to generate any shellcode (if applicable)
- Highlighted changes you have made
- An explanation of why those changes were made

# Exam Proofs

Your objective is to exploit each of the target machines and provide proof of exploitation. Each target machine contains at least one proof file, which you must retrieve, submit in your control panel, and include in a screenshot with your documentation. Failure to provide the appropriate proof files in a screenshot for a given level of access will result in zero points being awarded for the target.

The valid way to provide the contents of the proof files is in an interactive shell on the target machine with the `type` or cat `command` from their original location.

Obtaining the contents of the proof files in any other way will result in zero points for the target machine; this includes any type of web-based shell.

On all Windows targets, you must have a shell running with the permissions of one of the following to receive full points:

SYSTEM user
Administrator user
User with Administrator privileges
On all Linux targets, you must have a root shell in order to receive full points.

# Screenshot Requirements

Each local.txt and proof.txt found must be shown in a screenshot that includes the contents of the file, as well as the IP address of the target by using `ipconfig`, `ifconfig` or `ip addr`.

# Exam Restrictions

You cannot use any of the following on the exam:

- Spoofing (IP, ARP, DNS, NBNS, etc)
- Commercial tools or services (Metasploit Pro, Burp Pro, etc.)
- Automatic exploitation tools (e.g. db_autopwn, browser_autopwn, SQLmap, SQLninja etc.)
- Mass vulnerability scanners (e.g. Nessus, NeXpose, OpenVAS, Canvas, Core Impact, SAINT, etc.)
- Features in other tools that utilize either forbidden or restricted exam limitations

You may however, use tools such as Nmap (and its scripting engine), Nikto, Burp Free, DirBuster etc. against any of your target systems.

# Metasploit Restrictions

The usage of Metasploit and the Meterpreter payload are restricted during the exam. You may only use Metasploit modules ( Auxiliary, Exploit, and Post ) or the Meterpreter payload against one single target machine of your choice. Once you have selected your one target machine, you cannot use Metasploit modules ( Auxiliary, Exploit, or Post ) or the Meterpreter payload against any other machines.

You may use the following against all of the target machines:

- multi handler (aka exploit/multi/handler)
- msfvenom
- pattern_create.rb
- pattern_offset.rb

# Exam Proof Filenames

- proof.txt - This file is only accessible to the root or Administrator user and can be found under the /root/ directory or the Administrator Desktop. This file is available on every target machine.
- local.txt - This file is accessible to an un-privileged user account and can only be found on certain machines. The targets containing these files are detailed in your control panel.

# Point Allocation

- The order in which the exam machines are documented inside your exam report is the same order in which the exam machines will be graded and valued
- Points will be awarded for partial and complete administrative control of each target machine
- Each machine has a specific set of objectives that must be met in order to receive full points
- You must achieve a minimum score of 70 points to pass the exam
- It is possible to achieve a maximum of 100 points on the exam
- Specific objectives and point values for each machine are located in your exam control panel

# Submission Checklist

- Your exam report is in PDF format
- You have used the following format for the PDF file name "OSCP-OS-XXXXX-Exam-Report.pdf", where "OS-XXXXX" is your OSID
- Your PDF has been archived into a .7z file (Please do NOT archive it with a password)
- You have used the following format for the .7z file name "OSCP-OS-XXXXX-Exam-Report.7z", where "OS-XXXXX" is your OSID
- You have uploaded your .7z file to https://upload.offsec.com

Note that the filename is case sensitive. Students must submit their exam file following the exact filename format structure above. If your file does not follow the exact filename format and structure, the application will not accept it.

Please submit your .7z file via https://upload.offsec.com within 24 hours of completion of the exam and follow the provided instructions in order to upload your archived exam report.

After the file has been uploaded, you will be presented with a "Submit Files" button where a MD5 hash of your exam report will be displayed. Make sure to click the "Submit Files" button after verifying your MD5 hash to submit your files successfully.

# Acknowledgement of Receipt

Once we successfully review and accept your documentation, a confirmation email will be sent acknowledging receipt. If you have not received a confirmation email after 12 hours have passed, please send us an email at challenges AT offensive-security DOT com . We recommend you to check your email spam and junk folders in case it has been flagged as spam.

# Results

You will receive an email with your certification exam results (pass/fail) within ten (10) business days after submitting your documentation. If you have passed the exam, you will receive an exam results email containing a link to update and confirm your certificate delivery address. Please note that we do not provide the exam score, solutions to the exam targets, or digital versions of the certificate.
