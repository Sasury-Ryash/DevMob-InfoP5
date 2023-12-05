import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  final String email;

  User({required this.email});
}

class Cadastro {
  final String nome;
  final String descricao;

  Cadastro({required this.nome, this.descricao = ''});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Bem vindo ao sistema de inscrição institucional! Por favor, faça login.',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.email, color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  fillColor: Colors.white,
                  filled: true,
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  String email = emailController.text;
                  String passw = passController.text;

                  if (email.isNotEmpty && passw.isNotEmpty) {
                    User user = User(email: email);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MenuPage(user: user)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Preencha os campos obrigatórios'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 33, 243, 163),
                  onPrimary: const Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final User user;

  MenuPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.black,
      ),
      drawer: MyDrawer(user: user),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo, ${user.email}!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '        Este é o sistema de cadastro de funcionarios de instituições de ensino, por enquanto você poderá adicionar quantos funcionários desejar em cada uma das quatro categorias fornecidas. Para acessá-las, basta clicas nas três barras horizontais no canto superior esquerdo da tela.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final User user;

  MyDrawer({required this.user});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  user.email,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(
              'Cadastro de professores(as)',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroPage(
                        title: 'Adicione um(a) novo(a) professor(a)')),
              );
            },
          ),
          ListTile(
            title: Text(
              'Cadastro de coordenadores(as)',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroPage(
                        title: 'Adicione um(a) novo(a) coordenador(a)')),
              );
            },
          ),
          ListTile(
            title: Text(
              'Cadastro de secretarios(as)',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroPage(
                        title: 'Adicione um(a) novo(a) coordenador(a)')),
              );
            },
          ),
          ListTile(
            title: Text(
              'Cadastro de diretores(as)',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroPage(
                        title: 'Adicione um(a) novo(a) diretor(a)')),
              );
            },
          ),
          ListTile(
            title: Text(
              'Lista de Cadastros',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaCadastrosPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CadastroPage extends StatefulWidget {
  final String title;

  CadastroPage({required this.title});

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.black),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição (opcional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.description, color: Colors.black),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (nomeController.text.isNotEmpty) {
                  Cadastro novoCadastro = Cadastro(
                    nome: nomeController.text,
                    descricao: descricaoController.text,
                  );

                  listaCadastros.add(novoCadastro);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Cadastro salvo com sucesso!'),
                    ),
                  );

                  nomeController.clear();
                  descricaoController.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('O campo de nome é obrigatório.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Salvar Cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaCadastrosPage extends StatefulWidget {
  @override
  _ListaCadastrosPageState createState() => _ListaCadastrosPageState();
}

class _ListaCadastrosPageState extends State<ListaCadastrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cadastros'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: listaCadastros.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: Text(listaCadastros[index].nome),
              subtitle: Text(listaCadastros[index].descricao),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      _editarCadastro(context, index);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deletarCadastro(context, index);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _editarCadastro(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCadastroPage(
          cadastro: listaCadastros[index],
          onUpdate: (cadastro) {
            setState(() {
              listaCadastros[index] = cadastro;
            });
          },
        ),
      ),
    );
  }

  void _deletarCadastro(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmar exclusão'),
          content: Text('Deseja realmente excluir este cadastro?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  listaCadastros.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Excluir'),
            ),
          ],
        );
      },
    );
  }
}

class EditCadastroPage extends StatefulWidget {
  final Cadastro cadastro;
  final Function(Cadastro) onUpdate;

  EditCadastroPage({required this.cadastro, required this.onUpdate});

  @override
  _EditCadastroPageState createState() => _EditCadastroPageState();
}

class _EditCadastroPageState extends State<EditCadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nomeController.text = widget.cadastro.nome;
    descricaoController.text = widget.cadastro.descricao;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome *',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.black),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descricaoController,
              decoration: InputDecoration(
                labelText: 'Descrição (opcional)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.description, color: Colors.black),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (nomeController.text.isNotEmpty) {
                  Cadastro cadastroAtualizado = Cadastro(
                    nome: nomeController.text,
                    descricao: descricaoController.text,
                  );

                  widget.onUpdate(cadastroAtualizado);
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('O campo de nome é obrigatório.'),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

List<Cadastro> listaCadastros = [];
