from logging import DEBUG, Formatter, StreamHandler

from fabfile.main import *

logger = getLogger("FPC")
handler = StreamHandler()
handler.setFormatter(Formatter("%(asctime)s %(name)s:%(lineno)s %(funcName)s [%(levelname)s] %(message)s"))
handler.setLevel(DEBUG)
logger.setLevel(DEBUG)
logger.addHandler(handler)
