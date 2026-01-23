package com.busking.domain;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="gear") // ERD 보고 테이블명 작성
public class Gear {
	@Id
	private String id;

}
