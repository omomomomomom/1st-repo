#create a simple Flask web application that displays "Hello, World!" when accessed at the root URL ("/").
from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello():
    return "Hello, World omkar babar!"
if __name__ == "__main__":
    app.run(debug=True)

