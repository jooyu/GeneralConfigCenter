package org.yujoo.baas.base.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.yujoo.baas.base.entity.support.BaseEntity;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * <p>
 * 资源表
 * </p>
 *
 * @author SPPan
 * @since 2016-12-28
 */
@Entity
@Table(name = "tb_ranklist")
public class RankList extends BaseEntity {

	private static final long serialVersionUID = 1L;

	/**
	 * 资源id
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", nullable = false)
	private Integer id;

	/**
	 * 游戏id
	 */
	private Integer gameId;

	/**
	 * 排行榜单id
	 */
	private Integer leaderboardid;

	/**
	 * 过期类型
	 */
	private String expireType;

	/**
	 * 排行数
	 */
	private Integer limitRows;

	/**
	 * 分数区域
	 */
	private Integer scorePartion;

	/**
	 * 排序规则
	 */
	private String sortRule;

	/**
	 redis配置
	 */
	private String redisConfig;

	/**
	mysql配置
	 */
	private String mysqlConfig;

	/**
	 * 创建时间
	 */
	private Integer createTime;

	/**
	 * 扩展字段
	 */
	private String extend;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getGameId() {
		return gameId;
	}

	public void setGameId(Integer gameId) {
		this.gameId = gameId;
	}

	public Integer getLeaderboardid() {
		return leaderboardid;
	}

	public void setLeaderboardid(Integer leaderboardid) {
		this.leaderboardid = leaderboardid;
	}

	public String getExpireType() {
		return expireType;
	}

	public void setExpireType(String expireType) {
		this.expireType = expireType;
	}

	public Integer getLimitRows() {
		return limitRows;
	}

	public void setLimitRows(Integer limitRows) {
		this.limitRows = limitRows;
	}

	public Integer getScorePartion() {
		return scorePartion;
	}

	public void setScorePartion(Integer scorePartion) {
		this.scorePartion = scorePartion;
	}

	public String getSortRule() {
		return sortRule;
	}

	public void setSortRule(String sortRule) {
		this.sortRule = sortRule;
	}

	public String getRedisConfig() {
		return redisConfig;
	}

	public void setRedisConfig(String redisConfig) {
		this.redisConfig = redisConfig;
	}

	public String getMysqlConfig() {
		return mysqlConfig;
	}

	public void setMysqlConfig(String mysqlConfig) {
		this.mysqlConfig = mysqlConfig;
	}

	public Integer getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Integer createTime) {
		this.createTime = createTime;
	}

	public String getExtend() {
		return extend;
	}

	public void setExtend(String extend) {
		this.extend = extend;
	}

	



	

}
