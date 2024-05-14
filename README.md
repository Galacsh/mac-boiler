# MacOS Boiler

1. Install Xcode's command-line tools.

```shell
xcode-select --install 
```

2. Clone this repository.

```shell
git clone https://github.com/galacsh/mac-boiler.git
cd mac-boiler/ || exit
```

3. Register scripts as 'Launch Agents'.

```shell
./launch-agent/init.sh
```

4. Setup 'brew'.

```shell
./brew/init.sh
```

5. Setup 'zsh'.

```shell
./zsh/init.sh
```

6. Setup 'languages'.

```shell
./languages/init.sh
```

7. Install things in 'self-install'.

```shell
./self-install/init.sh
```

8. Setup other things.

```shell
./etc/init.sh
```

9. `.config` github clone and setup

```shell
curl -sSf https://raw.githubusercontent.com/Galacsh/config/main/install.sh | bash -s
```

