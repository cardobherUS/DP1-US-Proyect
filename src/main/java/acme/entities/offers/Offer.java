
package acme.entities.offers;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import acme.framework.datatypes.Money;
import acme.framework.entities.DomainEntity;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(indexes = {
	@Index(columnList = "deadline"),
	@Index(columnList = "ticker")
})
public class Offer extends DomainEntity {

	//Serialisation identifier
	private static final long	serialVersionUID	= 1L;

	//Atributes

	@NotBlank
	private String				title;

	@Temporal(TemporalType.TIMESTAMP)
	@Past
	private Date				creationMoment;

	@Temporal(TemporalType.TIMESTAMP)
	@NotNull
	private Date				deadline;

	@NotBlank
	private String				description;

	@NotNull
	@Valid
	private Money				minReward;

	@NotNull
	@Valid
	private Money				maxReward;

	@Column(unique = true)
	@NotBlank
	@Pattern(regexp = "^O[A-Z]{4}-\\d{5}$")
	private String				ticker;

}
