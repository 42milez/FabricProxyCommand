from logging import getLogger

from fabric import ThreadingGroup
from invoke import task

from fabfile.host import hosts

logger = getLogger("FPC").getChild("main")


@task(default=True)
def whoami(c):
    logger.debug("host: %s", c.host)
    logger.debug("original host: %s", c.original_host)
    c.connect_kwargs["banner_timeout"] = 30
    c.run("whoami")


@task
def dev(c, service=None, command=None, warn=False, print_result=True):
    target_hosts = []

    if service == "all":
        target_hosts = hosts["dev"]
    elif service in hosts["dev"]:
        target_hosts = hosts["dev"][service]
    else:
        logger.fatal("unsupported service")
        c.close()
        exit(-1)

    logger.debug("target_hosts: %s", target_hosts)

    group = ThreadingGroup(hosts=target_hosts)
    ret = group.run(command, warn=warn)

    if print_result:
        for connection, result in ret.items():
            logger.debug(connection.host + ": " + result.stdout.strip())

    return ret


@task
def stg(c, service=None, command=None, warn=False, print_result=True):
    print("service: {service}".format(service=service))
    print("command: {command}".format(command=command))


@task
def prod(c, service=None, command=None, warn=False, print_result=True):
    print("service: {service}".format(service=service))
    print("command: {command}".format(command=command))
