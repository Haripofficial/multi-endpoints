from flask import Flask, jsonify

app = Flask(__name__)

# API endpoint: /api/hello
@app.route('/api/hello')
def hello():
    return jsonify({"message": "Hello, world! This is the /api/hello endpoint."})

# API endpoint: /api/hai
@app.route('/api/hai')
def hai():
    return jsonify({"message": "Hai! Welcome to the /api/hai endpoint."})

# Private API endpoint: /private/night
@app.route('/private/night')
def night():
    return jsonify({"message": "Good night! This is a private endpoint for night."})

# Private API endpoint: /private/morning
@app.route('/private/morning')
def morning():
    return jsonify({"message": "Good morning! You've reached a private endpoint for morning."})

if __name__ == '__main__':
    app.run(debug=True)
