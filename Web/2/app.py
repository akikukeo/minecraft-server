from flask import Flask, render_template, request
import mcrcon

app = Flask(__name__)

# RCONの設定
RCON_HOST = 'localhost'  # サーバーのIPアドレス
RCON_PORT = 25575  # RCONポート（デフォルトは25575）
RCON_PASSWORD = 'your_rcon_password'  # 設定したパスワード

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/send_command', methods=['POST'])
def send_command():
    command = request.form['command']
    try:
        with mcrcon.MCRcon(RCON_HOST, RCON_PASSWORD) as mcr:
            response = mcr.command(command)
        return render_template('index.html', response=response)
    except Exception as e:
        return render_template('index.html', response=str(e))

if __name__ == '__main__':
    app.run(debug=True)
