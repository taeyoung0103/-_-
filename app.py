from flask import *
from flask_jwt_extended import *

app = Flask(import_name = __name__)

@app.route('/', methods=['GET'])
def main():
    return render_template('main.html')

if __name__ == '__main__':
    app.run(port = 5050, debug = True)
