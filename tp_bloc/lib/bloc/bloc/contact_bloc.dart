import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp_bloc/bloc/bloc/contact_event.dart';
import 'package:tp_bloc/bloc/bloc/contact_state.dart';
import 'package:tp_bloc/bloc/model/ContactModel.dart';
import 'package:tp_bloc/bloc/repositories/ContactRepository.dart';

class ContactBloc extends Bloc<ContactEvent,ContactState>{
  ContactRepository contactRepository;
     ContactEvent lastEvent=AucunEvenement();
  ContactBloc(ContactState contactState, this.contactRepository):super(contactState){
    on<ContactEvent>((event, emit) async{
       lastEvent=event;
      if(event is LoadAllContactsEvent){
        emit(ContactState(contacts: [],requestSate: RequestState.Loading,errorMessage: ""));
        List<Contact> contacts=await contactRepository.getAllContacts();
        emit(ContactState(contacts: contacts,requestSate: RequestState.Loaded,errorMessage: ""));
      }else  if(event is LoadBDCCContactsEvent){
        emit(ContactState(contacts: [],requestSate: RequestState.Loading,errorMessage: ""));
        try{
          List<Contact> contacts=await contactRepository.getContactsByGroup("BDCC");
          emit(ContactState(contacts: contacts,requestSate: RequestState.Loaded,errorMessage: ""));
        }catch( e){
          emit(ContactState(contacts: [],requestSate: RequestState.Error,errorMessage: e.toString()));
      }
      }
      else if(event is LoadGLSIDContactsEvent){
        emit(ContactState(contacts: [],requestSate: RequestState.Loading,errorMessage: ""));
        try{
          List<Contact> contacts=await contactRepository.getContactsByGroup("GLSID");
          emit(ContactState(contacts: contacts,requestSate: RequestState.Loaded,errorMessage: ""));
        }catch( e){
          emit(ContactState(contacts: [],requestSate: RequestState.Error,errorMessage: e.toString()));
        }
      }

    });
  }
}