from flask import Flask, render_template, request, jsonify
import subprocess

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/execute', methods=['POST'])
def execute_command():
    commands = request.form.getlist('command')  # フォームからすべてのコマンドを取得
    outputs = []

    for command in commands:
        if command:  # コマンドが空でない場合
            try:
                # コマンドを実行して結果を取得
                result = subprocess.run(command, shell=True, capture_output=True, text=True)
                output = result.stdout if result.returncode == 0 else result.stderr
            except Exception as e:
                output = str(e)
            outputs.append(f'コマンド: {command}\n結果:\n{output}')

    return jsonify({'output': "\n\n".join(outputs)})

if __name__ == '__main__':
    app.run(debug=True)
