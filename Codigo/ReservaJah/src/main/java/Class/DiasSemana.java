/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

/**
 *
 * @author eduardo
 */
public enum DiasSemana{
    SEG("Segunda"),TER("Terça"),QUA("Quarta"),QUI("Quinta"),SEX("Sexta"),SAB("Sábado");
    
    private String descricao;

    private DiasSemana(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        return this.descricao;
    }
    
}
