import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../models/usermodel.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(LoginState()) {
    on<LoginRequestEvent>(
      (event, emit) async {
        emit(LoadingState());

        try {
          UserCredential credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);

          final snap = await FirebaseFirestore.instance
              .collection("users")
              .doc(credential.user!.uid)
              .get();
          log(snap.data().toString());
          if (snap.data() != null) {
            UserModel userm = UserModel.fromMap(snap.data()!);
            if (userm.iscomp == false) {
              log("enteringstate");

              emit(ProfileIncompleteState());
            } else {
              emit(AuthSuccessState());
            }
          } else {
            emit(ErrorState("Whoops! Something Went Wrong"));
          }
        } on FirebaseException catch (err) {
          String? message;
          if (err.code.isNotEmpty) {
            message = err.code;
          } else {
            message = "An error occured,check your credentials";
          }
          emit(
            ErrorState(message),
          );
        }
      },
    );

    on<SignUpRequestEvent>(
      (event, emit) async {
        emit(LoadingState());
        try {
          UserCredential credential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: event.email, password: event.password);

          UserModel userinfo = UserModel(
              userid: credential.user!.uid,
              name: null,
              district: null,
              houseno: null,
              iscomp: false,
              morp: null,
              wardno: null);
          await FirebaseFirestore.instance
              .collection("users")
              .doc(credential.user!.uid)
              .set(
                userinfo.toMap(),
              );
          emit(
            ProfileIncompleteState(),
          );
        } on FirebaseAuthException catch (err) {
          String? message;
          if (err.code.isNotEmpty) {
            message = err.message;
          } else {
            message = "An error occured,check your credentials";
          }
          emit(
            ErrorState(message!),
          );

          message = err.code;
        }
      },
    );

    on<SignUpToggleEvent>(
      (event, emit) {
        emit(
          SignUpState(),
        );
      },
    );

    on<LoginToggleEvent>(
      (event, emit) {
        emit(
          LoginState(),
        );
      },
    );
  }
}
