
def encrypt(message)
    
    
    random = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a 
    
    encrypted_array = message.split('')
    
    encrypted_array.map! {|item| item == "a" ? "%" : item}
    encrypted_array.map! {|item| item == "e" ? "=" : item}
    encrypted_array.map! {|item| item == "i" ? "&" : item}
    encrypted_array.map! {|item| item == "o" ? "^" : item}
    encrypted_array.map! {|item| item == "u" ? "*" : item}
    encrypted_array.map! {|item| item == "t" ? "-" : item}
    encrypted_array.map! {|item| item == "s" ? "#" : item}
    encrypted_array.map! {|item| item == "n" ? "/" : item}
    encrypted_array.map! {|item| item == " " ? "<" : item}
    
    encrypted_array.insert(-1, random.sample)
    encrypted_array.insert(-2, random.sample)
    encrypted_array.insert(4, random.sample)
    encrypted_array.insert(0, random.sample)  
    encrypted_array.insert(1, random.sample * 2).reverse.join
    
end


def decrypt(encrypted_message)
    
    decrypted_array = encrypted_message.reverse.split('')
     
    decrypted_array.map! {|item| item == "%" ? "a" : item}
    decrypted_array.map! {|item| item == "=" ? "e" : item}
    decrypted_array.map! {|item| item == "&" ? "i" : item}
    decrypted_array.map! {|item| item == "^" ? "o" : item}
    decrypted_array.map! {|item| item == "*" ? "u" : item}
    decrypted_array.map! {|item| item == "-" ? "t" : item}
    decrypted_array.map! {|item| item == "#" ? "s" : item}
    decrypted_array.map! {|item| item == "/" ? "n" : item}
    decrypted_array.map! {|item| item == "<" ? " " : item}
    
    decrypted_array.slice! (0..2)
    decrypted_array.slice!(4)
    decrypted_array.slice!(-2)
    decrypted_array.slice! (-1)
    
    return decrypted_array.join
    
end