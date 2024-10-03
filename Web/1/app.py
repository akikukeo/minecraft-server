from flask import Flask, request, redirect, url_for, render_template, session, jsonify

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # セッションのための秘密鍵を設定します

# ユーザー名とパスワードを定義
USERS = {
    'admin': 'admin_password',  # adminアカウント
    'member': 'member_password',  # memberアカウント
}

@app.route('/')
def index():
    # ユーザーがログインしていない場合はログインページへリダイレクト
    if 'username' not in session:
        return redirect(url_for('login'))
    
    return render_template('index.html', username=session['username'])  # ユーザー名を渡す

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        
        # ユーザー名とパスワードの確認
        if username in USERS and USERS[username] == password:
            session['username'] = username  # セッションにユーザー名を保存
            return redirect(url_for('index'))
        else:
            return "ログイン失敗！ユーザー名またはパスワードが間違っています。"
    
    return render_template('login.html')  # GETリクエストの場合はログインフォームを表示

@app.route('/logout')
def logout():
    session.pop('username', None)  # セッションからユーザー名を削除
    return redirect(url_for('login'))

@app.route('/admin')
def admin():
    # admin専用ページ
    if 'username' not in session or session['username'] != 'admin':
        return redirect(url_for('login'))  # adminでない場合はログインページへリダイレクト
    return render_template('admin.html')  # adminページを表示

@app.route('/member')
def member():
    # member専用ページ
    if 'username' not in session or session['username'] != 'member':
        return redirect(url_for('login'))  # memberでない場合はログインページへリダイレクト
    return render_template('member.html')  # memberページを表示

@app.route('/api/data')
def get_data():
    return jsonify({'message': 'Hello from the server!'})

if __name__ == '__main__':
    app.run(debug=True)
