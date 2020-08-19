
package com.anilallewar.microservices.trace.dao;

import com.boxue.biz.api.trace.model.StatCrashLog;
import com.boxue.common.database.MyBatisRepository;

@MyBatisRepository
public interface StatCrashLogDao {

    /**
     * 插入数据.
     *
     * @param statCrashLog 详情
     * @return
     */
    public int insert(StatCrashLog statCrashLog);
}
