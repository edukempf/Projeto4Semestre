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
    SEG("Segunda-Feira"),TER("Terça-Feira"),QUA("Quarta-Feira"),QUI("Quinta-Feira"),SEX("Sexta-Feira"),SAB("Sábado");
    
    private String descricao;

    private DiasSemana(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public String toString() {
        return this.descricao;
    }
    
}
