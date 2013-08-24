/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author eduardo
 */
@Entity
public class Sala implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(length = 50)
    private String nome;
    @Column(length = 4)
    private int capacidade;
    @ManyToOne
    private Bloco blocoPertencente;
    @OneToOne
    private TipoSala tipoSala;
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    public Bloco getBlocoPertencente() {
        return blocoPertencente;
    }

    public void setBlocoPertencente(Bloco blocoPertencente) {
        this.blocoPertencente = blocoPertencente;
    }

    public TipoSala getTipoSala() {
        return tipoSala;
    }

    public void setTipoSala(TipoSala tipoSala) {
        this.tipoSala = tipoSala;
    }

      
    
}
