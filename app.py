from multiprocessing import Pool
from multiprocessing import cpu_count
from flask import Flask
import time

app = Flask(__name__)


@app.route('/')
def index():
    return 'Hello world'


@app.route('/intense')
def settimer():
    getcpuover75()


def getcpuover75():
    processes = cpu_count()
    return ('Utilizing %d cores' % processes)
    pool = Pool(processes)
    pool.map(overcpu, range(processes))
#   processces = cpu_count()
#   pool = Pool(processces)
#   pool.map(overcpu(10), range(processces))
#   app.route('/')


def overcpu(x):
    endtime = time.time() + 60
    while time.time() < endtime:
        x*x


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)
    print "worked"
