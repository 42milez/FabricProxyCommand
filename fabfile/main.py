from logging import DEBUG, Formatter, StreamHandler, getLogger

from fabric import Config, Connection
from invoke import task

logger = getLogger(__name__)
handler = StreamHandler()
handler.setFormatter(Formatter("%(asctime)s %(name)s:%(lineno)s %(funcName)s [%(levelname)s] %(message)s"))
handler.setLevel(DEBUG)
logger.setLevel(DEBUG)
logger.addHandler(handler)
logger.propagate = False

Config.ssh_config_path = "./ssh/config"


@task(default=True)
def whoami(conn):
    logger.debug("host: %s", conn.host)
    logger.debug("original host: %s", conn.original_host)
    ckwargs = {"banner_timeout": 30}
    c = Connection(host=conn.host, connect_kwargs=ckwargs)
    c.run("whoami")
