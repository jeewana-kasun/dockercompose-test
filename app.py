import time

import redis
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    count = '1'
    return f'Hello World! I have been seen {count} times.\n'
