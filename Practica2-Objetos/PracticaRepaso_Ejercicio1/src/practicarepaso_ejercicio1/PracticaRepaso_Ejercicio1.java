package practicarepaso_ejercicio1;

public class PracticaRepaso_Ejercicio1 {

    public static void main(String[] args) {
           
        Proyecto proyecto = new Proyecto("Proyecto 1", 1);
        
        proyecto.setNombreDirector("nomDirector1");
        proyecto.setApellidoDirector("apeDirector1");
        
        Investigador i1 = new Investigador("nomInv1", "apeInv1", 1, "especialidadInv1");
        Subsidio s1 = new Subsidio(10, "motivo1Inv1");
        Subsidio s2 = new Subsidio(20, "motivo2Inv1");
        i1.agregarSubsidio(s1);
        i1.agregarSubsidio(s2);
        i1.otorgarSubsidiosPendientes();
        proyecto.agregarInvestigador(i1);
        
        Investigador i2 = new Investigador("nomInv2", "apeInv2", 2, "especialidadInv2");
        Subsidio s3 = new Subsidio(10, "motivo1Inv2");
        Subsidio s4 = new Subsidio(20, "motivo2Inv2");
        i1.agregarSubsidio(s3);
        i1.agregarSubsidio(s4);
        proyecto.agregarInvestigador(i2);
        
        System.out.println(proyecto.toString());
    }
    
}
