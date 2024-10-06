/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jpa.entities;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Usuario
 */
@Entity
@Table(name = "orden")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Orden.findAll", query = "SELECT o FROM Orden o")
    , @NamedQuery(name = "Orden.findByIdOrden", query = "SELECT o FROM Orden o WHERE o.idOrden = :idOrden")
    , @NamedQuery(name = "Orden.findByCotosEnvio", query = "SELECT o FROM Orden o WHERE o.cotosEnvio = :cotosEnvio")
    , @NamedQuery(name = "Orden.findByNombreDestinatario", query = "SELECT o FROM Orden o WHERE o.nombreDestinatario = :nombreDestinatario")
    , @NamedQuery(name = "Orden.findByTelefonoDestinatario", query = "SELECT o FROM Orden o WHERE o.telefonoDestinatario = :telefonoDestinatario")
    , @NamedQuery(name = "Orden.findByValorTotalCompra", query = "SELECT o FROM Orden o WHERE o.valorTotalCompra = :valorTotalCompra")
    , @NamedQuery(name = "Orden.findByFechaEnvio", query = "SELECT o FROM Orden o WHERE o.fechaEnvio = :fechaEnvio")
    , @NamedQuery(name = "Orden.findByEstadoOrden", query = "SELECT o FROM Orden o WHERE o.estadoOrden = :estadoOrden")})
public class Orden implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_orden")
    private Integer idOrden;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Column(name = "cotosEnvio")
    private BigDecimal cotosEnvio;
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 1, max = 65535)
    @Column(name = "direccionEnvio")
    private String direccionEnvio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "nombreDestinatario")
    private String nombreDestinatario;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(name = "telefonoDestinatario")
    private String telefonoDestinatario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "valorTotalCompra")
    private BigDecimal valorTotalCompra;
    @Basic(optional = false)
    @NotNull
    @Column(name = "fechaEnvio")
    @Temporal(TemporalType.DATE)
    private Date fechaEnvio;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "estadoOrden")
    private String estadoOrden;
    @JoinColumn(name = "id_carrito", referencedColumnName = "id_carrito")
    @ManyToOne(optional = false)
    private Carrito idCarrito;
    @JoinColumn(name = "id_vendedor", referencedColumnName = "id_vendedor")
    @ManyToOne(optional = false)
    private Vendedor idVendedor;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "idOrden")
    private Collection<Pago> pagoCollection;

    public Orden() {
    }

    public Orden(Integer idOrden) {
        this.idOrden = idOrden;
    }

    public Orden(Integer idOrden, BigDecimal cotosEnvio, String direccionEnvio, String nombreDestinatario, String telefonoDestinatario, BigDecimal valorTotalCompra, Date fechaEnvio, String estadoOrden) {
        this.idOrden = idOrden;
        this.cotosEnvio = cotosEnvio;
        this.direccionEnvio = direccionEnvio;
        this.nombreDestinatario = nombreDestinatario;
        this.telefonoDestinatario = telefonoDestinatario;
        this.valorTotalCompra = valorTotalCompra;
        this.fechaEnvio = fechaEnvio;
        this.estadoOrden = estadoOrden;
    }

    public Integer getIdOrden() {
        return idOrden;
    }

    public void setIdOrden(Integer idOrden) {
        this.idOrden = idOrden;
    }

    public BigDecimal getCotosEnvio() {
        return cotosEnvio;
    }

    public void setCotosEnvio(BigDecimal cotosEnvio) {
        this.cotosEnvio = cotosEnvio;
    }

    public String getDireccionEnvio() {
        return direccionEnvio;
    }

    public void setDireccionEnvio(String direccionEnvio) {
        this.direccionEnvio = direccionEnvio;
    }

    public String getNombreDestinatario() {
        return nombreDestinatario;
    }

    public void setNombreDestinatario(String nombreDestinatario) {
        this.nombreDestinatario = nombreDestinatario;
    }

    public String getTelefonoDestinatario() {
        return telefonoDestinatario;
    }

    public void setTelefonoDestinatario(String telefonoDestinatario) {
        this.telefonoDestinatario = telefonoDestinatario;
    }

    public BigDecimal getValorTotalCompra() {
        return valorTotalCompra;
    }

    public void setValorTotalCompra(BigDecimal valorTotalCompra) {
        this.valorTotalCompra = valorTotalCompra;
    }

    public Date getFechaEnvio() {
        return fechaEnvio;
    }

    public void setFechaEnvio(Date fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public String getEstadoOrden() {
        return estadoOrden;
    }

    public void setEstadoOrden(String estadoOrden) {
        this.estadoOrden = estadoOrden;
    }

    public Carrito getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(Carrito idCarrito) {
        this.idCarrito = idCarrito;
    }

    public Vendedor getIdVendedor() {
        return idVendedor;
    }

    public void setIdVendedor(Vendedor idVendedor) {
        this.idVendedor = idVendedor;
    }

    @XmlTransient
    public Collection<Pago> getPagoCollection() {
        return pagoCollection;
    }

    public void setPagoCollection(Collection<Pago> pagoCollection) {
        this.pagoCollection = pagoCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idOrden != null ? idOrden.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Orden)) {
            return false;
        }
        Orden other = (Orden) object;
        if ((this.idOrden == null && other.idOrden != null) || (this.idOrden != null && !this.idOrden.equals(other.idOrden))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "jpa.entities.Orden[ idOrden=" + idOrden + " ]";
    }
    
}
