from flask import Flask, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/gpt/ping", methods=["GET"])
def ping():
    return jsonify({"response": "pong"})

if __name__ == "__main__":
    from waitress import serve
    from paste.translogger import TransLogger

    serve(TransLogger(app, setup_console_handler=False), host="0.0.0.0", port=80)
