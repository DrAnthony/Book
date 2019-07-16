package team.exm.book.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.exm.book.mapper.CodeMapper;
import team.exm.book.tool.CodeTimer;

@Service
public class CodeTimerService {

    private static Logger log = LoggerFactory.getLogger(CodeTimerService.class);

    @Autowired
    CodeService cs;
    @Autowired
    CodeMapper cm;

    private CodeTimer ct;

    private boolean checkCt() {
        if (ct == null) {
            log.info("code timer is null");
            return false;
        }
        return true;
    }

    public void setId(int id) {
        if (checkCt()) {
            ct.setCodeId(id);
        }
    }

    public void setStop(boolean b) {
        if (checkCt()) {
            ct.setStop(b);
        }
    }

    public void start() {
        ct = new CodeTimer();
        ct.setCm(cm);
        ct.start();
    }
}

