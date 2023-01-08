

def javascript(game, EXE, Path):
    val = 'xxxxxxx'
    html = '<tr> <td>{game}</td> <td>{EXE}</td> <td>{Path}</td> <td>'
    html = html + str('''
					<button
					class="btn btn-success"
					style="margin-left: 5px"
					type="submit"
					>
					<i
						class="fa fa-check"
						style="font-size: 15px"
					></i></button
					><button
					onclick="greet()"
					class="btn btn-danger"
					style="margin-left: 5px"
					type="submit"
					>
					<i
						class="fa fa-trash"
						style="font-size: 15px"
					></i>
					</button>
					</td>
					</tr> ''').format()
    print(html)

javascript('asrefgasdg', 'asdgasdg', 'asdgasdg')