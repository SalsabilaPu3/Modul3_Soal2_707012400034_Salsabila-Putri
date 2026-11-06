// lib/pages/halaman_produk.dart 
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';  

import '../models/keranjang_model.dart'; 

class HalamanProduk extends StatelessWidget {   
  const HalamanProduk({super.key});  

  static const daftarProduk = [     
    Produk(nama: 'manggo sticky rice', harga: 35000, ikon: '🥭'),     
    Produk(nama: 'Dubai Chewy  Cookie', harga: 30000, ikon: '🍫'),     
    Produk(nama: 'Matcha Latte', harga: 20000, ikon: '🍵'),   ];    
  
  String rupiah(int nilai) {     
    return 'Rp${nilai.toString()}';   
    }    
    
    @override   
    Widget build(BuildContext context) {     
      return ListView.separated(       
        padding: const EdgeInsets.all(16),       
        itemCount: daftarProduk.length,       
        separatorBuilder: (context, indeks) => const SizedBox(height: 8),       
        itemBuilder: (context, indeks) {         
          final produk = daftarProduk[indeks];          
          
          return Card(           
            child: ListTile(             
              leading: Text(               
                produk.ikon,               
                style: const TextStyle(fontSize: 32),             
                ),             
                title: Text(produk.nama),             
                subtitle: Text(rupiah(produk.harga)),             
                trailing: FilledButton(               
                  onPressed: () {                 
                    context.read<KeranjangModel>().tambah(produk);               
                    }, 
                    
                    child: const Text('Tambah'),            
                    ),           
                  ),         
                );       
              },     
            );   
          } 
}