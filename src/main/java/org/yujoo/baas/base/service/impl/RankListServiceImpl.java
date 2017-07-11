package org.yujoo.baas.base.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.yujoo.baas.base.common.CommonUtil;
import org.yujoo.baas.base.config.RedisRepository;
import org.yujoo.baas.base.dao.IRankListDao;
import org.yujoo.baas.base.dao.support.IBaseDao;
import org.yujoo.baas.base.entity.RankList;
import org.yujoo.baas.base.service.IRankListService;
import org.yujoo.baas.base.service.support.impl.BaseServiceImpl;

import com.alibaba.fastjson.JSON;

/**
 * <p>
 * 资源表 服务实现类
 * </p>
 *
 * @author SPPan
 * @since 2016-12-28
 */
@Service
public class RankListServiceImpl extends BaseServiceImpl<RankList, Integer>
		implements IRankListService {

	
	
	
	@Autowired
	private IRankListDao rankListDao;

	@Autowired
	private RedisRepository redisRepository;

	@Override
	public IBaseDao<RankList, Integer> getBaseDao() {
		return this.rankListDao;
	}



	@Override
//	@CacheEvict(value = "resourceCache")
	public void saveOrUpdate(RankList ranklist) {
		if(ranklist.getId() != null){
			RankList dbRankList = find(ranklist.getId());
			dbRankList.setGameId(ranklist.getGameId());
			dbRankList.setLeaderboardid(ranklist.getLeaderboardid());
			dbRankList.setLimitRows(ranklist.getLimitRows());
			dbRankList.setScorePartion(ranklist.getScorePartion());
			dbRankList.setSortRule(ranklist.getSortRule());
			dbRankList.setRedisConfig(ranklist.getRedisConfig());
			dbRankList.setMysqlConfig(ranklist.getRedisConfig());
			dbRankList.setCreateTime(CommonUtil.getNowTimeStamp());
			dbRankList.setExpireType(ranklist.getExpireType());
			dbRankList.setExtend(ranklist.getExtend());
			update(dbRankList);
			//不断存不存在 setredis
			String redisKey=ranklist.getGameId()+"_"+ranklist.getLeaderboardid()+"_config";
			redisRepository.set(redisKey, JSON.toJSONString(ranklist));
		}else{
			ranklist.setCreateTime(CommonUtil.getNowTimeStamp());
			save(ranklist);
			//不管存不存在setredis
			String redisKey=ranklist.getGameId()+"_"+ranklist.getLeaderboardid()+"_config";
			redisRepository.set(redisKey, JSON.toJSONString(ranklist));
		}
	}

	@Override
//	@CacheEvict(value = "resourceCache")
	public void delete(Integer id) {
		//删除key  delredis
		RankList ranklist =rankListDao.getOne(id);
		String redisKey=ranklist.getGameId()+"_"+ranklist.getLeaderboardid()+"_config";
		redisRepository.del(redisKey);
		
		//删除db
		rankListDao.deleteGrant(id);
		
	
		
	
	}



	
}
