# FabricProxyCommand
![GitHub](https://img.shields.io/github/license/42milez/FabricProxyCommand)

[Fabric](https://github.com/fabric/fabric) is able to execute shell commands remotely over SSH. This repository offers an environment to be able to try performing such tasks locally using Docker.

In this example, Fabric uses the bastion host as a gateway to connect to the target host.

## Quick Start
### 1. Install Python packages
```shell
python -m venv ./venv
. ./venv/bin/activate
pip install -r requirements.txt
```

### 2. Generate SSH keys
```shell
./gen_ssh_keys.sh
```

### 3. Build containers
```shell
./build.sh
```

### 4. Run containers
Start two containers, `bastion` and `target`.
```shell
docker-compose up -d
```

### 5. Run task
Perform a fabric task on the target host.
```shell
fab -H target-proxy whoami
```

## Notes
- Install pre-commit hook: `pre-commit install`
- Apply lint checks: `make lint`
- Reformat code: `make format`
- Scan local Docker images: `./scan.sh`

## References
- Python
  - [Python caching in GitHub Actions](https://medium.com/ai2-blog/python-caching-in-github-actions-e9452698e98d)
  - [Fabric2 へ移行した際の雑Tips](https://kumak1.hatenablog.com/entry/2018/05/18/181347)
  - [Pythonのコードフォーマッターについての個人的ベストプラクティス](https://qiita.com/sin9270/items/85e2dab4c0144c79987d#%E7%9B%B4%E6%8E%A5%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%82%92%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B)
  - [fabric2のインストール手順と簡単な使い方](https://qiita.com/Esfahan/items/1e4bdf14b4a22263a1cf#fab%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%A7%E3%81%AF%E3%81%AA%E3%81%8Fpython%E3%82%B3%E3%83%9E%E3%83%B3%E3%83%89%E3%81%A7%E5%AE%9F%E8%A1%8C%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95)
- SSH
  - [ProxyCommandを使って踏み台(Bastion)経由で直接ssh/scpする](https://dev.classmethod.jp/articles/direct-ssh-by-proxycommand/)
