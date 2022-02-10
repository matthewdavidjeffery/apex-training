public interface Animal {

    //Oxygen level s/b in implementation in spO
    void breathe();

    //Sound in dB
    Integer makeSound();

    void eat();
}

//#region Canine
public abstract class Canine implements Animal {   
    
    // Tracks oxygen level in %spO
    public Integer bloodOxygen {get; set;}

    //Reponds with type of dog
    public String breed {get; set;}

    public Canine() {
        this.breed = 'unknown';
        this.bloodOxygen = 100;
    }

    public void breathe() {
        this.bloodOxygen += 10;
    }
    
    public void eat() {
        System.debug('Canine eating');
    }

    // Can be overridden, normal dog sound is 80dB
    public virtual Integer makeSound() {
        return 80;
    }
    
    // Bite strength in PSI
    public abstract Double bite();
}

public class Hyena extends Canine {

    public Hyena() {
        super();
        this.breed = 'Hyena';
    }
    
    public override Double bite () {
        return 50.0d;
    }

    // Hyenas make a lot of sound
    public override Integer makeSound() {
        return 120;
    }    
}

public class GermanShepherd extends Canine {

    public GermanShepherd() {
        super();
        this.breed = 'GermanShepherd';
    }
    
    public override Double bite() {
        return 13.0d;
    }
    
}

//#endregion


//#region Feline
public abstract class Feline implements Animal {
    
    // Tracking blood oxygen level in %spO
    public Integer bloodOxygen {get; set;}

    public String breed {get; set;}
    
    public Feline() {
        this.breed = 'unknown';
        bloodOxygen = 100;
    }    
    
    public void breathe() {
        bloodOxygen += 10;
    }
    
    // In dB
    public virtual Integer makeSound() {
        return 40;
    }

    public void eat() {
        System.debug('Feline Eating');
    }
    
    // Will return attack pressure in Pa
    public abstract Double attack();
}

public class Tabby extends Feline {
	
    public Tabby() {
        super();
        this.breed = 'Tabby';
    }
    
    //Tabbys, while dangerous, succeed at the frequency of their attacks rather than
    //their strength 
    public override Double attack() {
        return 1.0d;
    }
}

public class Siamese extends Feline {

    public Siamese() {
        super();
        this.breed = 'I am Siamese if you please';
    }
    
    //Siamese are pretty weak among the felines
    public override Double attack() {
        return 2.0d;
    }
    
    //Siamese cats are louder than other small felines and more annoying
    public override Integer makeSound() {
        return 80;
    }
    
}
//#endregion

