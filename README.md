# OsuCursorChanger
Osu!の任意のスキンで複数のカーソルとヒットサウンドを簡単に変えることができるバッチファイル。

# ・ダウンロード
[ここ](https://github.com/KerorinNorthFox/OsuCursorChanger/releases/latest/download/OsuCursorChanger-v1.0.1-release.zip)からダウンロードして、任意のスキンフォルダにScriptsフォルダを配置することですぐに使い始めることができます。

# ・使い方
1.zipファイルを[ダウンロード](#ダウンロード)して解凍する。

2.中身のScriptsフォルダを任意のスキンフォルダに配置する。(複数のスキンでカーソルやヒットサウンドを変更したい場合、それぞれにScriptsフォルダを配置してください。)

3-1.スキンフォルダに<strong>Cursors</strong>フォルダを作成し、その中にカーソルごとのフォルダを作成し入れる。(カーソルの入ったフォルダの作り方は[後述](#カーソルヒットサウンドを抽出したフォルダの作り方))

3-2.スキンフォルダに<strong>HitSounds</strong>フォルダを作成し、その中にヒットサウンドごとのフォルダを作成し入れる。(ヒットサウンドの入ったフォルダの作り方は[後述](#カーソルヒットサウンドを抽出したフォルダの作り方))

4-1.Scriptsフォルダ内のOsuCursorChanger.batを実行し、変更したいカーソルの名前に対応する番号を入力して決定するとカーソルが変更される。

4-2.Scriptsフォルダ内のOsuHitSoundChanger.batを実行し、変更したいヒットサウンドの名前に対応する番号を入力して決定するとヒットサウンドが変更される。

### フォルダ構成の例
```
osu!
|---Skins
.   |---任意のスキン
.   .   |---Cursors # 自分で作成。ここにカーソルを入れたフォルダを入れていく
.   .   |   |---Cursor1
    .   |   |   |---cursor.png
        |   |   |---cursortrail.png
        |   |   ...
        |   |---Cursor2
        |   ...
        |---HitSounds # 自分で作成。ここにヒットサウンドを入れたフォルダを入れていく
        |   |---HitSound1
        |   |   |---drum-hitclap.wav
        |   |   |---drum-hitfinish.wav
        |   |   ...
        |   |---HitSound2
        |   ...
        |---Scripts
        |   |---hitsounds.list # DO NOT CHANGE
        |   |---OsuCursorChanger.bat # これを実行してカーソルを変更する
        |   `---OsuHitSoundChanger.bat # これを実行してヒットサウンドを変更する
        ...
```

https://github.com/KerorinNorthFox/OsuCursorChanger/assets/66837061/5eb21573-34d7-4a01-923b-99324a309ba0



# ・カーソル/ヒットサウンドを抽出したフォルダの作り方
1. 解凍したzipファイルの中にあるMakeScriptsフォルダをカーソルやヒットサウンドを抽出したいスキンフォルダに配置する。
2. MakeScriptsフォルダ内のmakeCursorExample.batかmakeHitSoundExample.batを実行すると、カーソルやヒットサウンドが抽出されたフォルダがスキンフォルダ内に作成(CursorExample又はHitSoundExampleフォルダ)される。
3. 作成されたフォルダをCursorsフォルダ又はHitSoundsフォルダ内に配置して任意の名前を変更する。
4. makeScriptsフォルダを削除する。

# ・カーソルとヒットサウンドのダウンロード
カーソルとヒットサウンドをいくつか用意しました。
カーソルは[ここ](https://github.com/KerorinNorthFox/OsuCursorChanger/releases/latest/download/Cursors.zip)、ヒットサウンドは[ここ](https://github.com/KerorinNorthFox/OsuCursorChanger/releases/latest/download/HitSounds.zip)からダウンロードできます。

# ・Q＆A
### Q.DefaultCursorBackupやDefaultHitSoundBackupって何?
### A.変更する前の元のカーソルやヒットサウンドが残してあるため消さないでください。
<br>

### Q.スキンを元の状態に戻すには?
### A.バッチファイルを開いて'0'を入力して決定すると、元のカーソルやヒットサウンドが適用されます。又は、DefaultCursorBackupやDefaultHitSoundBackupというフォルダに元のカーソルやヒットサウンドが残してあります。
<br>

### Q.カーソルやヒットサウンドが変更されてない
### A.CursorsフォルダやHitSoundsフォルダの名前が間違っていると正しく変更されません。末尾の"s"を忘れていないかなど確認してください。
