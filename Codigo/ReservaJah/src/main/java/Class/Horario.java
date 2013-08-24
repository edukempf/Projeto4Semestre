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
    M1("M1"),M2("M2"),M3("M3"),M4("M4"),M5("M5"),M6("M6"),
    T1("T1"),T2("T2"),T3("T3"),T4("T4"),T5("T5"),T6("T6"),
    N1("N1"),N2("N2"),N3("N3"),N4("N4"),N5("N5");
    
    private String descricao;

    private Horario(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        return this.descricao;
    }
    
}
