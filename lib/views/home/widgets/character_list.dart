import 'package:breaking_bad_bloc/views/personalDetails/personal_details_view.dart';
import 'package:flutter/material.dart';

List<Widget> characterList(List data, context) {
  return List.generate(
    data.length,
    (index) => GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return PersonalDetails(
                charactersModel: data[index],
              );
            },
          ),
        );

      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                          '${data[index].img}',
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Text(
                '${data[index].name}',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
