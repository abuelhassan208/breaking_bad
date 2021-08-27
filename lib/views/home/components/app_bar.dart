import 'package:breaking_bad_bloc/views/home/bloc/cubit/cubit.dart';
import 'package:flutter/material.dart';

homeAppBar(context) => AppBar(
      backgroundColor: Colors.white12,
      title: HomeCubit.of(context).isSearch
          ? Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (text) {
                          HomeCubit.of(context).search(text);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Text(''),
      actions: [
        MaterialButton(
          onPressed: () {
            HomeCubit.of(context).clickSearch();
          },
          child: Icon(Icons.search,color: Colors.white,),
        )
      ],
    );
