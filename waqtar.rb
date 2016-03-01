# Program za mjerenje vremenske razlike između dva termina, u toku jednog dana | 24 sata
# Author: Rusmir Gadžo [rusmirgadzo@gmail.com]
# http://rubyonrails.blogger.ba
# verzija: 1.0 | bosanski | 23.09.2009. godine

=begin
CAUSA: Moja Nokia3650 ima mjerač u alarmu koji pokazuje koliko je ostalo vremena dok se alarm ne aktivira. Pomislio sam kako bi ovo možda bilo korisno i za neke druge programe. Recimo,...za izračunavanje razlike u vremenskim zonama?
=end

# Komentari su se odnosili na izvorni program, napisan prije sedam godina.

=begin
Danas je ovo prilika da se reaktivira, unaprijedi, a ovaj pri primjer posluži da naučimo kako koristiti komentar u programskom jeziku Ruby.Vjerujem da već prepoznajete da sve što dolazi iza znaka # predstavlja jednolinijski komentar, a ono što dolazi u više linija, ograničava se rezervisanim riječima =begin i =end. Najprije ću u master postaviti originalni program, a na njegovim unaprijeđenjima ću raditi s vremenom. Planiram napraviti i verziju u Ruby on Rails frameworku. Jasno mi je da su varijable pomalo ekstravagantne i da linijski layout programa može biti ljepši, pa je to možda i prvo na čemu ću raditi.
=end

# Program za mjerenje vremenskog gap-a u toku jednog dana | 24 sata
# Author: Rusmir Gadžo [rusmirgadzo@gmail.com]
# http://rubyonrails.blogger.ba
# verzija: 1.0 | bosanski

=begin
CAUSA: Moja Nokia3650 ima mjerač u alarmu koji pokazuje
koliko je ostalo vremena dok se alarm ne aktivira. Pomislio
sam kako bi ovo možda bilo korisno i za neke druge programe.
Recimo,...za izračunavanje razlike u vremenskim zonama?
=end

def waqtar()
puts
puts
puts "########## WAQTAR ##########"
puts

# Unos vremenskog raspona
print "# Unesi početno vrijeme (hh:mm): "
tempusPrincipalis = gets.chomp
puts
print "# Unesi krajnje vrijeme (hh:mm): "
tempusExtrema = gets.chomp

# Fragmentacija dobijenih podataka
horaPrima = tempusPrincipalis[0,2].to_i
minPrima = tempusPrincipalis[3,4].to_i
horaSecunda = tempusExtrema[0,2].to_i
minSecunda = tempusExtrema[3,4].to_i
puts
puts

# Obavještenje
# ! dodati kod za ograničenje sata na 23 - minuta na 60 !
puts "# Vremenski raspon: " + tempusPrincipalis + " | " + tempusExtrema
puts

    if tempusPrincipalis.length != 5 or tempusExtrema.length != 5
        puts "Grješka! Pravilan format za unos vremena je hh:mm!"
        puts "Pokušajte ponovo!"
    elsif (horaPrima <= horaSecunda)
        puts "Obračun vremena u istom danu"
        # Ex: od 09:30 do 14:50
        minLijevoTotal = ((12 - horaPrima) * 60) - minPrima
        minDesnoTotal = ((horaSecunda - 12) * 60) + minSecunda
        puts "Sati: " + (minLijevoTotal + minDesnoTotal).div(60).to_s
        puts "Minuta: " + (minLijevoTotal + minDesnoTotal).modulo(60).to_s
    else
        # Ex: od 18:50 do 03:20
        puts "# Obračun vremena u različitom danu"
        minLijevoTotal = ((24 - horaPrima) * 60) - minPrima
        minDesnoTotal = ((12 - (12 - horaSecunda)) * 60) + minSecunda
        puts
        puts "Sati: " + (minLijevoTotal + minDesnoTotal).div(60).to_s
        puts "Minuta: " + (minLijevoTotal + minDesnoTotal).modulo(60).to_s
    end

end

puts
puts "############################"
puts

waqtar()




