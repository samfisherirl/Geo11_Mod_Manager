import time


class Import:
    def run(lib):
        # complete steam library importation:
        # lib = parse.main()
        # complete steam library importation
        vals = ''
        for i in lib[1]:
            #if i.longpath != 'xxxx':
            val = Import.javascript(str(i[0]), str(i[1]), str(i[1]), str(i[4]))
            vals = vals + val

        time.sleep(0.1)
        storage = vals
        return storage

    def javascript(game, EXE, Path, id):

        htmlA = '<td>{}</td> <td>{}</td> <td>{}</td> <td>'.format(Path, EXE, game)
        htmlB = f'<button class="btn btn-success" onclick="select({id})" style="margin-left: 5px" type="submit" > <i ' \
                f'class="fa fa-check" style="font-size: 15px" ></i></button ><button onclick="greet()" class="btn ' \
                f'btn-danger" style="margin-left: 5px" type="submit" > <i class="fa fa-trash" style="font-size: 15px" ' \
                f'></i> </button> </td></tr>'.strip()
        return str(htmlA + htmlB)
