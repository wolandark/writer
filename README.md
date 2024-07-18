# Writer
Writer is a minimal vim9 configuration for writers in less than 300 lines!

# Prerequisites 
- Vim >= 9.0 (Preferably compiled with huge features)
- Unzip (To extract the languagetool archive)
- Java >= 8 (To run languagetool)
- Dictd (For the vimdict plugin)
- Bourne SHELL (For running the installation script)
- Termgui capable terminal emulator (XTerm, Konsole, Alacrity etc ...)

# Installation

```
git clone https://github.com/wolandark/writer.git
cd writer
./install.sh
```

Everything will be setup for you automatically.


<!-- ### With Goyo
![image](https://github.com/wolandark/writer/assets/107309764/8c54baf3-0a77-421d-8830-1107783672bd)
![image](https://github.com/wolandark/writer/assets/107309764/011e651a-50ee-4839-a429-b7ca7ff55842)
### With Limelight

### Minimal statusline with word count
![image](https://github.com/wolandark/writer/assets/107309764/3dcfe195-3b57-493a-ba40-a3f6246c738c)
-->

### Screenshots

<details><summary>Expand Screenshots</summary>

  # Minimal statusline with word count
![image](https://github.com/user-attachments/assets/321b2fa6-ae5d-46b6-9a6d-b30de6f75fbe)
# Distraction free writing/reading
![image](https://github.com/user-attachments/assets/a8ef2089-2f8d-47b1-9fa3-ede88f9f4513)
![image](https://github.com/user-attachments/assets/0038264e-2ec7-438e-818a-913d6e5e5723)
# Dictionary popup (Using dictd)
![image](https://github.com/user-attachments/assets/2ac489cc-58f2-4c86-9ae2-0dac78d6b2de)
# Built-in theasaurus 
![image](https://github.com/user-attachments/assets/0af016bd-4cf5-4ae6-9ed9-84106084bbb2)
# Grammer cheker using opensource languagetool (needs java >=8)
![image](https://github.com/user-attachments/assets/de66ddb9-5901-4292-952a-3147abb69976)
# Unicode lines, boxes, spell checking and correction, formatting and justification
![image](https://github.com/user-attachments/assets/f15a40bf-b753-43b6-a615-3e3152d9293e)

</details>
<!--
  <table border="1">
        <tr>
            <td><img src="https://github.com/user-attachments/assets/321b2fa6-ae5d-46b6-9a6d-b30de6f75fbe" alt="Image 1"></td>
            <td><img src="https://github.com/user-attachments/assets/a8ef2089-2f8d-47b1-9fa3-ede88f9f4513" alt="Image 2"></td>
            <td><img src="https://github.com/user-attachments/assets/0038264e-2ec7-438e-818a-913d6e5e5723" alt="Image 3"></td>
        </tr>
        <tr>
            <td><img src="https://github.com/user-attachments/assets/2ac489cc-58f2-4c86-9ae2-0dac78d6b2de" alt="Image 4"></td>
            <td><img src="https://github.com/user-attachments/assets/0af016bd-4cf5-4ae6-9ed9-84106084bbb2" alt="Image 5"></td>
            <td><img src="https://github.com/user-attachments/assets/de66ddb9-5901-4292-952a-3147abb69976" alt="Image 6"></td>
        </tr>
        <tr>
            <td><img src="https://github.com/user-attachments/assets/f15a40bf-b753-43b6-a615-3e3152d9293e" alt="Image 7"></td>
            <td></td>
            <td></td>
        </tr>
    </table>
-->

<details>
<summary>Expand Keybindings</summary>

# Keybindings
 | Mode        | Mapping               | Command                                   |
 | ----------- | --------------------  | ----------------------------------------- |
 | Normal      | \<nowait\>\a          | :call AutoSaveToggle()\<CR\>              |
 | Normal      | Q                     | mmgqG`m                                   |
 | Normal      | Y                     | y$                                        |
 | Normal      | YA                    | :%y                                       |
 | Insert      | \<Tab\>               | \<C-n\>                                   |
 | Insert      | \<S-Tab\>             | \<C-p\>                                   |
 | Insert      | \<C-U\>               | \<C-G\>u\<C-U\>                           |
 | Normal      | \<leader\>\           | :.!toilet -w 200 -f term -F border\<CR\>  |
 | Normal      | \<leader\>S           | :normal! O\<ESC\>jo\<ESC\>kzzk\<CR\>      |
 | Normal      | \<leader\>[           | :normal! O\<ESC\>j                        |
 | Normal      | \<leader\>]           | :normal! o\<ESC\>k                        |
 | Normal      | \<nowait\>\<leader\>w | :w!\<CR\>                                 |
 | Normal      | \<leader\>so          | :w\<CR\>:source %\<CR\>                   |
 | Normal      | \<leader\>k           | :m .-2\<CR\>                              |
 | Normal      | \<leader\>j           | :m .+1\<CR\>                              |
 | Visual      | K                     | :m .-2\<CR\>gv=gv                         |
 | Visual      | J                     | :m .+1\<CR\>gv=gv                         |
 | Insert      | \<nowait\> jj         | \<ESC\>                                   |
 | Normal      | \<C-h\>               | \<C-w\>h                                  |
 | Normal      | \<C-j\>               | \<C-w\>j                                  |
 | Normal      | \<C-k\>               | \<C-w\>k                                  |
 | Normal      | \<C-l\>               | \<C-w\>l                                  |
 | Normal      | \<C-LEFT\>            | \<C-w\>h                                  |
 | Normal      | \<C-DOWN\>            | \<C-w\>j                                  |
 | Normal      | \<C-UP\>              | \<C-w\>k                                  |
 | Normal      | \<C-RIGHT\>           | \<C-w\>l                                  |
 | Normal      | \<s-Right\>           | :vertical resize +5 \<CR\>                |
 | Normal      | \<s-LEFT\>            | :vertical resize -5 \<CR\>                |
 | Normal      | \<s-UP\>              | :resize +5 \<CR\>                         |
 | Normal      | \<s-DOWN\>            | :resize -5 \<CR\>                         |
 | Normal      | \<silent\>\<ESC\>     | \<ESC\>:noh\<CR\>\<ESC\>                  |
 | Normal      | \<F2\>                | :Dict \<CR\>                              |
 | Visual      | \<F3\>                | :DDGV \<CR\>                              |
 | Normal      | \co                   | :Colors\<CR\>                             |
 | Normal      | \f                    | \<Cmd\>call stargate#OKvim(1)\<CR\>       |
 | Normal      | \F                    | \<Cmd\>call stargate#OKvim(2)\<CR\>       |
 | Normal      | gs                    | :FixSpell\<CR\>                           |
 | Normal      | \<F6\>                | :setlocal spell! spelllang=en_us\<CR\>    |
 | Normal      | ]g                    | ]s                                        |
 | Normal      | [g                    | [s                                        |
 | Normal      | \<F5\>                | :UndotreeToggle\<CR\>                     |

</details>


# License 
Same as Vim. 
See `:help license`
