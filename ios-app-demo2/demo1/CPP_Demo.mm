#import "CPP_Demo.h"
#include <map>
#include <string>
#include <stdio.h>

class MaxentModelFloat_TN
{
    public:
    MaxentModelFloat_TN()
    {
        n_len_word_ = 0;
        n_num_labels_ = 0;
        n_len_base_index_ = 0;
        n_len_hash_weight_ = 0;
 
        p_word_ = NULL;
        p_label_buf_ = NULL;
        pp_label_buf_ = NULL;
        p_base_index_ = NULL;
        p_hash_weight_ = NULL;
    }
 
    ~MaxentModelFloat_TN()
    {
        delete []p_word_;
        delete []p_label_buf_;
        delete []pp_label_buf_;
        delete []p_base_index_;
        delete []p_hash_weight_;
    }
private:
    //std::unordered_map<std::string, double> features_dict;
    //std::vector<std::string> labels;
    //std::string word;

    int32_t n_len_word_;
    int32_t n_num_labels_;
    int32_t n_len_labels_;
    int32_t double_hash_len_;
    int32_t n_len_base_index_;
    int32_t n_len_hash_weight_;
 
    char* p_word_;
    char* p_label_buf_;
    char** pp_label_buf_;
    char* p_base_index_;
    char* p_hash_weight_;

public:
    void load_bin()
    {
        printf("load_bin success \n");
    }
};

@implementation CPP_Demo

- (void)test {
    std::map<std::string, std::string> map;
    
    MaxentModelFloat_TN** me_models_point = new MaxentModelFloat_TN*[8];
    std::map<std::string, MaxentModelFloat_TN*> me_models_new;

    for (int i = 0; i < 5; i++)
    {
        me_models_point[i] = new MaxentModelFloat_TN();
        MaxentModelFloat_TN*& me = me_models_point[i];
        me->load_bin();

        std::string dyzword = "fraction";
        me_models_new[dyzword] = me;
    }
}

@end
