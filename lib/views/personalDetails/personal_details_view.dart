
import 'package:breaking_bad_bloc/views/home/models/characters_model.dart';
import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  final CharactersModel charactersModel;

  const PersonalDetails({Key? key, required this.charactersModel})
      : super(key: key);

  @override
  _PersonalDetailsState createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  TextStyle style =
  TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white12,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.8,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                        '${widget.charactersModel.img}',
                      ),
                      fit: BoxFit.fill)),
            ),
            Text(
              ' Name : ${widget.charactersModel.name}',
              style: style,
            ),
            Text(
              ' Status : ${widget.charactersModel.status}',
              style: style,
            ),
            Text(
              ' Birthday : ${widget.charactersModel.birthday}',
              style: style,
            ),
            Text(
              ' Nickname : ${widget.charactersModel.nickname}',
              style: style,
            ),
            Text(
              ' Portrayed : ${widget.charactersModel.portrayed}',
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
