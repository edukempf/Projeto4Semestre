/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

/**
 *
 * @author eduardo
 */
public enum Horario {
    M1("07:30"),M2("08:20"),M3("09:10"),M4("10:20"),M5("11:10"),M6("12:00"),
    T1("13:00"),T2("13:50"),T3("14:40"),T4("15:50"),T5("16:40"),T6("17:30"),
    N1("18:40"),N2("19:30"),N3("20:20"),N4("21:20"),N5("22:10");
    
    private String descricao;

    private Horario(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        return this.descricao;
    }
    
}
