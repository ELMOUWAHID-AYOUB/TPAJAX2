
import java.util.Date;
import ma.school.beans.Etudiant;
import ma.school.beans.Machine;
import ma.school.beans.Marque;
import ma.school.util.HibernateUtil;
import ma.school.service.EtudiantService;
import ma.school.service.MachineService;
import ma.school.service.MarqueService;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author leblond
 */
public class Test {
    public static void main(String[] args) {
        EtudiantService es = new EtudiantService();
         MachineService ms = new MachineService();
          MarqueService mas = new MarqueService();
        es.create(new Etudiant("RAMI", "ALI", "Agadir", new Date(), "homme"));
         mas.create(new Marque("dacia", "DA"));
         Marque mas1 =  mas.findById(1);
        ms.create(new Machine("m1dd", new Date(), 700, mas1 ));
        for(Etudiant e : es.findAll())
            System.out.println(e.getId()+" "+e.getNom());
    }
}
